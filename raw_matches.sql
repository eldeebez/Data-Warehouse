/*
in this file I am creating the raw table that will recieve the extracted data from the dataset using the bulk insert, in the bronze layer. all the columns in the table are
typically named as the dataset

*/


USE mini_project;
GO

CREATE TABLE raw_matches (
    League VARCHAR(100),
    Home VARCHAR(100),
    Away VARCHAR(100),
    Round VARCHAR(20),
    Date DATE,
    Time VARCHAR(10),
    H_Score INT,
    A_Score INT,
    HT_H_Score INT,
    HT_A_Score INT,
    WIN VARCHAR(10),
    H_Ball_Possession FLOAT,
    A_Ball_Possession FLOAT,
    H_Goal_Attempts INT,
    A_Goal_Attempts INT,
    H_Shots_on_Goal INT,
    A_Shots_on_Goal INT,
    H_Attacks INT,
    A_Attacks INT,
    H_Dangerous_Attacks INT,
    A_Dangerous_Attacks INT,
    H_Shots_off_Goal INT,
    A_Shots_off_Goal INT,
    H_Blocked_Shots INT,
    A_Blocked_Shots INT,
    H_Free_Kicks INT,
    A_Free_Kicks INT,
    H_Corner_Kicks INT,
    A_Corner_Kicks INT,
    H_Offsides INT,
    A_Offsides INT,
    H_Throw_in INT,
    A_Throw_in INT,
    H_Goalkeeper_Saves INT,
    A_Goalkeeper_Saves INT,
    H_Fouls INT,
    A_Fouls INT,
    H_Yellow_Cards INT,
    A_Yellow_Cards INT
);
