import React, { useState, useEffect } from 'react';
import './pluginlist.css';

const PluginList = () => {
  const [plugins, setPlugins] = useState([]);
  const [error, setError] = useState(null);

  const fetchPlugins = () => {
    fetch('/')
      .then(response => {
        if (!response.ok) {
          throw new Error(`Error: ${response.status} - ${response.statusText}`);
        }
        return response.json();
      })
      .then(data => {
        setPlugins(JSON.parse(data.plugins));
        setError(null);
      })
      .catch(error => {
        setPlugins([]);
        setError(data.plugins);
      });
  };

  useEffect(() => {
    fetchPlugins();
  }, []);

  return (
    <div className="pluginContainer">
      <button onClick={fetchPlugins} >Fetch plugins</button>
      <ul className="pluginList">
        {plugins.map((plugin, index) => (
          <li key={index} className="pluginItem">{plugin}</li>
        ))}
      </ul>
    </div>
  );
};

export default PluginList;
