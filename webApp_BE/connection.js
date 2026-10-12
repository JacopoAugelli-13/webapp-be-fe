import mysql from 'mysql2/promise'

export const connector = await mysql.createConnection({
    user: 'root',
    host: 'localhost',
    password: '1010A1010a,',
    database: 'movies_db',
    port: 3306
})