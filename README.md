# README

## Description 

### Project Conversation History

- This Rails application enables users to add comments to projects and update project status.
- The application provides a complete history of conversations, including comments and status changes for the project.
- It uses Rails built-in SQLite3 database, with two projects will be loadded when run db seeds for demonstration.


## Setup

### Prerequisites
- Ruby 3.3.5
- Rails 8.0.1
- Sqlite3

### Installation
1. Clone the repository:
   ```
   git clone git@github.com:dinesh16/project_conversation_history.git
   cd project_conversation_history
   ```

2. Install dependencies:
   ```
   bundle install
   ```

3. DB Setup:
   ```
   rails db:migrate && rails db:seed
   ```

4. Start the server:
   ```
   rails s
   ```

Go to: `http://localhost:3000`.

## Testing
To run the test suite:
```
rspec
```
