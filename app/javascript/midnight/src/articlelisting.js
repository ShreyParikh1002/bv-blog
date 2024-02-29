import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import './articlelisting.css'; // Import CSS file

const ArticleListing = () => {
  const [articles, setArticles] = useState([]);

  const fetchArticles = () => {
    fetch('/users')
      .then(response => response.json())
      .then(data => {
        setArticles(data.articles);
      })
      .catch(error => console.error('Error fetching articles:', error));
  };

  useEffect(() => {
    fetchArticles();
  }, []);

  return (
    <div className="container">
      <h1>Articles</h1>
      {console.log(articles)}
      <p>Our blog has {articles.length} articles and counting!</p>
      <div className="articleContainer">
        {articles.map(article => (
          <div key={article.id} className="articleCard">
            <h2>{article.title}</h2>
            <Link to={`/articles/${article.id}`} className="readMoreLink">Read more</Link>
          </div>
        ))}
      </div>
    </div>
  );
};

export default ArticleListing;
