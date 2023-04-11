import express from 'express';
import * as process from 'process';
import dotenv from 'dotenv';

dotenv.config();

const app = express();

const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
	res.send({ deploy: true });
});

app.get('/panic', (req, res) => {
	process.exit(1);
	res.send({ deploy: true });
});

app.listen(PORT, () => {
	console.log(`Server is running on port ${PORT}`);
});