# Inventory Management System Simple Prototype

**Pre-requisites**:
Need to have Elixir 1.18.2+, Erlang 27.3+, Node 20+ and npm, PostgreSQL 15+ and Phoenix installed on your machine.

## Data Model

The Data Model is pretty simple actually. I have defined two tables Item and InventoryMovement.
**Item**: [id: UUID(auto-generated primary key) , name: string, SKU:string, unit: string ]
**InventoryMovement**: [id: UUID(auto-gen), item_id: UUID (ref Item), movement_type: (in|out|adjustment), quantity: integer]

## Stock Calculation Logic

It is pretty simple. I am enforcing constraint that whenever the stock movement is 'in' I only accept quantity as positive and for 'out' it would be negative and for adjustment we can have any value. So by this logic I can just iterate and sum the quantity values form whole movement history.

Stock = sum(total_positive_flow - total_negative_flow +- adjustment)

## How to run the project

If you have everything from the prerequisites installed it is pretty easy to run the project:

Firstly for the backend go into the **backend/config/dev.exs** and **backend/config/test.exs** and replace DB credentials with your own local config.

To run the backend:

```
mix deps.get # install the dependencies
mix phx.server # to start the backend server
```

To run the frontend:

```
npm install # to install the dependencies
npm run dev # to start the frontend
```

Backend runs on port 4000 and frontend runs on port 5173,
If you change these ports, also edit them in the frontend and backend. In the backend update the CORS settings. In the frontend, update in the **src/api/client.ts file**.
I haven't used a .env file in frontend because this is a pretty simple app.

## Assumptions and Improvements

I assumed that for 'in' movement the quantity will always need to be given as positive and the opposite for 'out'. Whereas, for 'adjustment' the value could be any integral value.

I have written test to check for stock calculation logic and negative stock prevention as well. These were directly on to the context layer functions not on the controller layer.

I personally haven't made any grand improvements per se in my own implementation but the following can be done to my implementation to make it better.

I think the code would be better if it had more error responses and even handling them in the frontend could be good. Can make the files lesser because some auto generated files when I created the context for tables have been left as is.
