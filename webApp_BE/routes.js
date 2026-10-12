import express from 'express';
import { connector } from './connection.js';
import mysql from 'mysql2/promise';

export const router = express.Router();

router.get('/movies', async (req, res, next) => {
    try {
        const [result] = await connector.query('SELECT * FROM movies');
        res.status(200).json(result);
    }
    catch (err) {
        next(err);
    }
})

router.get('/movies/:id', async (req, res, next) => {
    try {
        const filmRequest = parseInt(req.params.id);
        const query =
            'SELECT movies.*, reviews.vote FROM movies LEFT JOIN reviews ON movies.id = reviews.movie_id WHERE movies.id = ?';
       
        const [result] = await connector.query(query, [filmRequest]);
        res.status(200).json({
            message: "questo è il film che stai cercando e queste sono le sue recensioni",
            data: result
        })
    }
    catch (err) {
        next(err);
    }
})