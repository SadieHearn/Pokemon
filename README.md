# Pokemon

Table Creation and Fulfilling Client Requests
--
A table was built within SQL to list Pokemon and their stats from generations 1 through 3. The purpose of this project was to practice communication with a client (played by my husband) and use data exploration techniques to produce the information requested.

The client, Logan, wanted help building his ideal Pokemon team. He is overwhelmed by the number of Pokemon and needs help narrowing down 
the list to pick from. He saied he prefers multi-type pokemon and his favorite generations are 1 & 3. Also, his favorite Pokemon is Mudkip.

To help figure out the best team for him, Logan was asked a bit about his fighting style:
1. Which stats do you prioritize (Health, Attack, Defense, etc)?
2. Do you prefer a specific primary type?
3. Do you want a team that includes legendary Pokemon?

Logan's responses:
1. Priotitizes attack and apeed. His goal is to be able to attack first and deplete as much of the opponent's HP as possible in the first hit.
2. Water types are his favorite though he wants to have a diverse team, hence the affintity for multi-type Pokemon.
3. He has an interest in someday playing tournaments which do not allow for legendaries.

After presenting the data to Logan, he was worried he was too picky and isn't sure if he'll have enough Pokemon to pick from for each 
PrimaryType. He wanted to know how many of each primary type there were under the conditions he previously gave.

Logan then decided there were enough to choose from for his favorite PrimaryTypes. Since he was satisfied by the results, he thought the best way to build his team wpuld be by picking the Pokemon with the highest Speed for the primary types Dragon, Grass, Fire, Normal, and Poison. If two or more Pokemon share the top speed for their primary type, prioritize by attack next. He mentioned a Pokemon team has 6 Pokemon. Of course, he wanted to include Mudkip as well.

Web Scraping with Python 
--
Initially, Microsoft SQL Server was used to create a table of Pokemon from generations 1-3 and their stats to query the data within the table. That SQL script manually created a table and entered all of the data of Pokemon, however this is a tedious and time consuming method of collecting data, especially if new Pokemon need to be added periodically.

Rather than using SQL to manually fill in data, a Python script was used to scrape all of the necessary data from the Pokemon online database, insert it into a dataframe, then create a .csv file to be used in other software.

Files
---
| File Name  | Description |
| ------------- | ------------- |
| pokemon_project.sql | SQL script which creates a table describing the Pokemon and queries the data to  asnwer client questions and create a team according the client specifications. |
| pokemon_web_scraping.ipynb | Python script used to scrape data from a Pokemon website and create a dataframe. |

Software
--
Miscrosft SQL Server: Table creation and data exploration

Jupyter Notebook: Write Python script for web scraping and .csv file creation

Data Sources
---
https://gist.github.com/pamelafox/26b9357c6120d3d0d27c2b90c950e8c6

Web Scraping: https://pokemondb.net/pokedex/all

Author
---
Sadie Hearn

Email: sadie.ae.hearn@gmail.com

LinkedIn: linkedin.com/in/sadiehearn
