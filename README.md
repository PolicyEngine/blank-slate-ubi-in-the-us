# Blank Slate UBI in the US

This project analyzes the impact of a Blank Slate Universal Basic Income (UBI) in the United States using PolicyEngine.

## Prerequisites

- [Visual Studio Code](https://code.visualstudio.com/)
- [GitHub account](https://github.com/)
- Python 3.11
- macOS (instructions are for Homebrew users)

## Setup Instructions

1. Fork the repository:

   - Visit [https://github.com/PolicyEngine/blank-slate-ubi-in-the-us](https://github.com/PolicyEngine/blank-slate-ubi-in-the-us)
   - Click the "Fork" button in the top-right corner
   - Choose your GitHub account as the destination for the fork

2. Clone your forked repository using VS Code:

   - Open VS Code
   - Press `Cmd+Shift+P` to open the Command Palette
   - Type "Git: Clone" and select it
   - Paste the URL of your forked repository
   - Choose a local directory to clone into

3. Install Python 3.11 using Homebrew:

   ```bash
   brew update
   brew install python@3.11
   ```

4. Add Python 3.11 to your PATH by adding these lines to your `~/.zshrc` file:

   ```bash
   export PATH="/opt/homebrew/opt/python@3.11/bin:$PATH"
   alias python3.11="/opt/homebrew/opt/python@3.11/bin/python3.11"
   ```

5. Apply the changes:

   ```bash
   source ~/.zshrc
   ```

6. Open a terminal in VS Code (Terminal > New Terminal) and run:

   ```bash
   make
   ```

   This command will:

   - Check for Python 3.11
   - Create a virtual environment
   - Install all required packages
   - Set up a Jupyter kernel
   - Execute both notebooks in sequence: `blank_slate_ubi.ipynb` and `charts.ipynb`

## Project Structure

- `blank_slate_ubi.ipynb`: Main analysis notebook
- `charts.ipynb`: Notebook for generating charts based on the analysis
- `requirements.txt`: List of Python package dependencies
- `Makefile`: Automates the setup and execution process
- `ubi_amounts.csv`: Contains UBI amounts data
- `optimisation_results.csv`: Contains optimization results
- `json_data.json`: Contains JSON data for analysis

## Additional Commands

- To only set up the environment without running the notebooks:

  ```bash
  make setup
  ```

- To run the notebooks after setup:

  ```bash
  make run
  ```

- To clean up the environment and generated files:
  ```bash
  make clean
  ```

## Troubleshooting

If you encounter any issues:

1. Ensure Python 3.11 is installed and active:

   ```bash
   python3.11 --version
   ```

2. If you're having issues with pip or package installations, try:

   ```bash
   make clean
   make
   ```

3. If you encounter an "externally-managed-environment" error, ensure you're using the virtual environment:

   ```bash
   source policyengine_env/bin/activate
   ```

   Then run pip commands within this environment.

4. For any other issues, please check the error messages in the console output. The Makefile includes verbose output to help identify where problems occur.

## Contributing

If you make changes to the project dependencies, please update the `requirements.txt` file:

```bash
policyengine_env/bin/pip freeze > requirements.txt
```

## Contact

For questions or issues, please open an issue on the GitHub repository.
