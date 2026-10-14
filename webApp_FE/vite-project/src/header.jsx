import { NavLink } from 'react-router-dom'
import './details.css';

export const Header = () => {

    return (

        <header>

            <nav className='NavBar'>
                <NavLink to="/">Home</NavLink>
                <NavLink to="/movies/:id">Dettagli</NavLink>
            </nav>

        </header>

    )
}