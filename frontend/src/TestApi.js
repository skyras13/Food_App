import React, { useState } from 'react';

function TestAPI() {
    const [data, setData] = useState(null);

    const fetchData = async () => {
        try {
            const response = await fetch('/api/getCompletion');
            const result = await response.text();
            setData(result);
        } catch (error) {
            console.error("There was an error fetching the data.", error);
        }
    }

    return (
        <div>
            <button onClick={fetchData}>Test API</button>
            {data && <div>Data from API: {JSON.stringify(data)}</div>}
        </div>
    );
}

export default TestAPI;
