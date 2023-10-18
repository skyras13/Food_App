const express = require('express');
const axios = require('axios');
const OpenAIApi = require('openai');
const multer = require('multer');
const path = require('path');
const fs = require("fs").promises;


const openai = new OpenAIApi({ apiKey: process.env.CHATGPT_API_KEY});
const app = express();
const port = process.env.SERVER_PORT || 3000;

// Setup storage with multer
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, './uploads/');
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + path.extname(file.originalname)); // Appending extension
    },
});

const upload = multer({ storage: storage });

app.post('/upload', upload.single('uploadedFile'), async (req, res) => {
    if (!req.file) {
        return res.status(400).send('No file uploaded');
    }
    
    const uploadedFilePath = req.file.path;

    // TODO: Add your processing logic here

    //   const fineTune = await openai.fineTuning.jobs.create({
    //     training_file: file->id
    //   });
    
    // Return the URL to the processed file (in this example, it's the same file)
    // res.json({ url: `http://localhost/api/${uploadedFilePath}` });

    try {
        // Read the file into memory
        const fileContent = await fs.readFile(uploadedFilePath, "utf-8");

        // TODO: Feed the fileContent to ChatGPT or any other processing

        const maxChunkSize = 10000;  // Adjust based on token limit
        const fileParts = fileContent.match(new RegExp(`.{1,${maxChunkSize}}`, 'g'));

        let responses = [];

        console.log("Here");

        for (let i = 0; i < fileParts.length; i++) {
            const partContent = `Part ${i + 1} of the file: ${fileParts[i]}`;
            const gptResponse = await openai.chat.completions.create({
                    model: "gpt-3.5-turbo-16k",
                    messages: [
                      {"role": "user", "content": partContent}
                    ],
                    temperature: 0.6,
                  });
            console.log(gptResponse.choices[0]);
            
            responses.push(gptResponse.choices[0]);
        }

        const consolidatedResponse = responses.join(' ');  // Join the parts for a consolidated response

        const cheatSheetPrompt = `Based on the following content, create a cheat sheet:\n\n${consolidatedResponse}`;
        const cheatSheetResponse = await openai.chat.completions.create({
            model: "gpt-3.5-turbo-16k",
            messages: [
              {"role": "user", "content": cheatSheetPrompt}
            ],
            temperature: 0.6,
          });

        res.json({ processedContent: consolidatedResponse, cheatSheet: cheatSheetResponse.choices[0] });

        // const completion = await openai.chat.completions.create({
        //     model: "gpt-3.5-turbo-16k",
        //     messages: [
        //     //   {"role": "system", "content": "You are a helpful assistant."},
        //       {"role": "user", "content": `Read this file and create a cheat sheet from it. The file start after this. ${fileContent}`}
        //     ],
        //     temperature: 0.6,
        //     // max_tokens:5000
        //   });


        // For example:
        // const response = await chatGPT.process(fileContent);

        // Return the processed content or any other relevant info
        res.json(completion.choices[0]);
    } catch (error) {
        console.error("Error processing the file:", error);
        res.status(500).send('Error processing the file');
    }
});

// Serve uploaded files as static resources
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

app.get('/', (req, res) => {
    res.send("Hello World");
});

app.get('/getCompletion', async (req, res) => {
    try {
        const completion = await openai.chat.completions.create({
            model: "gpt-3.5-turbo",
            messages: [
            //   {"role": "system", "content": "You are a helpful assistant."},
              {"role": "user", "content": "Hello!"}
            ],
            temperature: 0.6,
            max_tokens:5000
          });

          console.log(completion.choices[0]);

        res.json(completion.choices[0]);
    } catch (error) {
        console.error('Error fetching data from OpenAI:', error);
        res.status(500).json({ error: 'Failed to fetch data from OpenAI' });
    }
});


app.listen(port, '0.0.0.0', () => {
    console.log(`Server is running on port ${port}`);
});
