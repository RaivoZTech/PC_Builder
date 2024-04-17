//Import statements
import React, { useEffect, useState, useCallback } from 'react';
import axios from 'axios';
import NavBarMain from '../components/NavBarMain';
import Footer from '../components/Footer';
//Tech news function to fetch news trough API
function TechNews() {
    const [news, setNews] = useState([]);
    const [currentPage, setCurrentPage] = useState(1);
    const [totalPages, setTotalPages] = useState(0);
    const API_KEY = 'a0751c10fc4049d8a6a9bcf65c7cb8d5';
    const MAX_PAGES = 5;

    // Memoize the fetchNews function
const fetchNews = useCallback(async () => {
    try {
        const keywords = '"CPU" OR "GPU" OR "MOTHERBOARD" OR "PSU" OR "SSD" OR "NVIDIA" OR "AMD" OR "COMPUTER HARDWARE" OR "PC COMPONENTS" OR "GAMING COMPUTERS"';
        const response = await axios.get(`https://newsapi.org/v2/everything?q=${encodeURIComponent(keywords)}&language=en&pageSize=10&page=${currentPage}&apiKey=${API_KEY}`);
        setNews(response.data.articles);
        setTotalPages(Math.min(Math.ceil(response.data.totalResults / 10), MAX_PAGES));
    } catch (error) {
        console.error('Error fetching news:', error);
    }
}, [currentPage, API_KEY]); // Dependencies

useEffect(() => {
    fetchNews();
}, [fetchNews]);

const handlePageChange = (newPage) => {
    setCurrentPage(newPage);
    window.scrollTo(0, 0);
};


    return (
        <div>
            <NavBarMain />
            <div className="d-flex flex-column h-100 bg-light">
                <main className="flex-shrink-0">
                    <div className="container px-5 my-5">
                        <div className="text-center mb-5">
                        <h1 className="display-5 fw-bolder mb-0"><span className="text-gradient d-inline">Latest Tech News</span></h1>
                        </div>
                        <div className="news-container">
                            {news.map((item, index) => (
                                <div key={index} className="news-item">
                                    <img src={item.urlToImage} alt={item.title} className="news-image" />
                                    <div className="news-content">
                                        <h2 className="news-title">{item.title}</h2>
                                        <p className="news-description">{item.description}</p>
                                        <a href={item.url} className="read-more-btn" target="_blank" rel="noopener noreferrer">Read More</a>
                                    </div>
                                </div>
                            ))}
                        </div>
                        <div className="pagination-container">
                            {Array.from({ length: totalPages }, (_, i) => i + 1).map(pageNumber => (
                                <button key={pageNumber} onClick={() => handlePageChange(pageNumber)} className={pageNumber === currentPage ? "page-btn active" : "page-btn"}>
                                    {pageNumber}
                                </button>
                            ))}
                        </div>
                    </div>
                </main>
                <Footer />
            </div>
        </div>
    );
}

export default TechNews;
