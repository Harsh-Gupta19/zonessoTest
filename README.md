This is the backend project where we have two folders as mentioned below:
1) Database (Postgres) : Its have "apis" database where we have two tables. One is "Vehicles" and another one is "Showroom" from this we are getting the 3 apis with the help of node express.
2) Node Express (Backend):  In this project we have backend project where we are connecting to database and fetching the details as per different services.
   * We have to firstly install the node dependency from "npm i" command.
   * In Vehicles uder the models folder we have to give our database name and password in order to run this project.
   * Once database connection established in terminal run "npm run dev" command to run the server.
   * You are good to go for fecthing the below apis.

    #  /api/motors : Get all vehicles list
    #  /api/motors/1 : Get Specific vehicle details based upon id.
    #  /showrooms : Get the showrooms details
