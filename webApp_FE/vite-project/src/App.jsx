import { useEffect, useState } from 'react'
import { BrowserRouter, Routes, Route, useParams, Link } from 'react-router-dom';

import { Home } from './assets/home.jsx'
import { Details } from './assets/details.jsx'
import { Header } from './assets/header.jsx';
import './App.css'

export const MyApi = () => {
  const [movies, setMovies] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch('http://localhost:3000/movies/')
      .then((res) => res.json())
      .then((data) => {
        setMovies(data);
        setLoading(false);
        console.log("DATI RICEVUTI DAL SERVER:", data); // <-- GUARDA COSA ESCI IN CONSOLE
      })
      .catch((err) => {
      console.error('errore dati non trovati', err)
      setLoading(false);
      
      
    })

}, []);

if (loading) return <p>Caricamento...</p>;

return (
  <>
    <div className="container">
      <h1>Catalogo Film</h1>

      <ul>
        {movies.map((movie) => (
          <li key={movie.id}>
            <Link to={`/movies/${movie.id}`}>
              <strong>{movie.title}</strong> - {movie.abstract}
            </Link>
          </li>
        ))}
      </ul>
    </div>

  </>
)
};



export const App = () => {

  return (
    <>
      <Header />

      <Routes>

        <Route path="/" element={<MyApi />}></Route>
        <Route path="/movies/:id" element={<Details />}></Route>

      </Routes>
    </>
  )
}

export default App
