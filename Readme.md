## DBT Tutorial / Showcase Example

This repository serves as both a tutorial and a showcase for learning and demonstrating the capabilities of dbt (data build tool). The project structure divides the learning process into incremental steps with increasing complexity in dbt usage.

Each step of the project is organized within the `step` directory, where subfolders are named according to each step. These subfolders contain a detailed markdown document that describes the tasks and goals of that particular step, alongside any necessary supplementary files.

The main dbt project files are located in the `dbt_project` directory. To facilitate learning progression and version control, the repository is tagged at the beginning of each step. Users can clone the repository at any specific step by checking out to the respective tag (e.g., `git pull  https://github.com/MickaelLopes/dbt-project.git@step1 for starting directly from Step 2).

## Prerequisites

Before starting with the project, ensure you have the following prerequisites setup:

- **Database Access:** For this tutorial, you'll need access to a database. I recommend setting up a local PostgreSQL database. Tools like DBeaver can enhance database interaction.
- **Database Credentials:** Instead of using admin credentials, create a user for dbt operations (e.g., `dbt_user`) and allocate appropriate permissions for this user on your database.
- **Python Environment:** It's a common practice to use a virtual environment to manage dependencies better. For this tutorial, setting up a Python environment using venv or conda is advisable. I am using Python 3.11 for this project. 

Please ensure all tools and settings are in place before proceeding with the database configuration and dbt setup.
