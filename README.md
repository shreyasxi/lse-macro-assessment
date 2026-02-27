\# LSE Centre for Macroeconomics - Pre-Doctoral Assessment



\*\*Author:\*\* Shreyas Urgunde 

\*\*Date:\*\* January 2026  



\## Overview

This repository contains my completed technical assessment for the Pre-Doctoral Research Assistant position at the LSE Centre for Macroeconomics. The project involved compentencies to handle complex macroeconomic data, critically evaluate research methodologies, and solve dynamic programming problems computationally.



The assessment consists of three main components:

1\. \*\*Empirical Analysis (Task A):\*\* Analyzing Total Factor Productivity (TFP) growth across five European economies (2000-2023). It documents procyclical productivity patterns and a positive cross-sectional relationship between TFP and export intensity using fixed-effects regressions on Eurostat national accounts data.

2\. \*\*Research Evaluation (Task B):\*\* Proposing methodological improvements to Parle (2022) on ECB communication tone, specifically suggesting multi-channel extensions and the use of modern transformer-based sentiment models (e.g., FinBERT, CB-LMs).

3\. \*\*Macroeconomic Modeling (Task C):\*\* Solving a heterogeneous-agent consumption-savings model with income uncertainty. This involves using Value Function Iteration (VFI) to derive the Euler equation, compute stationary distributions, and calibrate the discount factor to match empirical estimates of the Marginal Propensity to Consume (MPC).



\## Skills \& Tools Demonstrated

\* \*\*Languages:\*\* Python

\* \*\*Econometrics \& Data:\*\* Fixed-effects regressions (`linearmodels`), Eurostat API integration (`eurostat`), data cleaning, and manipulation (`pandas`, `numpy`).

\* \*\*Macroeconomics:\*\* Dynamic Programming, Value Function Iteration, modeling borrowing constraints, Marginal Propensity to Consume (MPC).

\* \*\*Visualization:\*\* `matplotlib`, `seaborn`.



\## Repository Structure

```text

├── data/

│   ├── raw/                      # Original downloads (e.g., recession.xlsx)

│   └── processed/                # Cleaned and merged datasets

├── docs/

│   ├── Assessment\_Report.pdf     # Final written report summarizing findings

│   └── Task\_Instructions.pdf     # Original assignment prompt

├── notebooks/

│   └── macro\_analysis.ipynb      # Complete Python code for data analysis and VFI

├── output/

│   ├── figures/                  # Generated plots and charts

│   └── tables/                   # Descriptive stats, regression results

├── requirements.txt              # Python dependencies

└── README.md                     # Project overview



\## Installation \& Replication



1\. \*\*Clone the repository:\*\*

&nbsp;  ```bash

&nbsp;  git clone \[https://github.com/](https://github.com/)\[shreyasxi]/lse-macro-assessment.git

&nbsp;  cd lse-macro-assessment



2\. \*\*Install the required dependencies:\*\*

&nbsp;  This project uses Python 3. Ensure you have it installed, then run:

&nbsp;  ```bash

&nbsp;  pip install -r requirements.txt



3\. \*\*Run the analysis:\*\*

&nbsp;  Open the Jupyter Notebook to view or execute the code:

&nbsp;  ```bash

&nbsp;  jupyter notebook notebooks/macro\_analysis.ipynb



Note: The notebook fetches raw national accounts data directly via the Eurostat API, so an active internet connection is required to run those specific cells.

Disclaimer



This is a completed technical assessment for a past application. The prompt and original task instructions remain the intellectual property of the LSE Centre for Macroeconomics.

