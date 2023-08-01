import express, {Request, Response} from 'express';

const app = express()

app.get('/', (req: Request, res:Response) => {
    return res.json({
        status: "Successfully crreated"
    })
} );
app.listen(4000, () => console.log("Listening to port 4000"));