import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import './details.css';


export const Details = () => {
    const { id } = useParams();

    const [movie, setMovie] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetch(`http://localhost:3000/movies/${id}`)
            .then((res) => {
                if (!res.ok) {
                    throw new Error("Film non trovato sul server");
                }
                return res.json();
            })
            .then((response) => {
                console.log("Risposta completa dal BE:", response);
                setMovie(response.data);
                setLoading(false);
            })
            .catch((err) => {
                console.error("Errore:", err);
                setError("torna indietro.");
                setLoading(false);
            });
    }, [id]);

    if (loading) return <p>Caricamento dettagli in corso...</p>;
    if (error) return <p style={{ color: 'red' }}>Seleziona il film dalla Home, non da Qua!!! {error}</p>;
    if (!movie) return <p>Nessun film trovato.</p>;

    return (
        <div className="container">
            <Link className="comeBack" to="/">&larr; Torna alla Home</Link>

            <h1>{movie[0]?.title}</h1>
            <div className="containerDati">
                <img
                    src={`http://localhost:3000/image/${movie[0]?.image}`}
                    alt={movie[0]?.title}
                />
                <p className="nAutore">Autore: {movie[0]?.director}</p>

                <h2>Recensioni:</h2>
                <ul>
                    {movie.map((row, index) => (
                        <li key={index}>Voto: {row.vote} by {row.name} : {row.text} </li>
                    ))}
                    <span className="vuoto">---</span>
                </ul>
            </div>
        </div>
    );
};