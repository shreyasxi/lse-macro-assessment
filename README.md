# LSE Centre for Macroeconomics - Pre-Doctoral Assessment

**Author:** Shreyas Urgunde  
**Date:** January 2026  

📄 **Paper**: [Read the Final Assessment Report Here](https://shreyasxi.github.io/lse-macro-assessment/docs/Assessment_Report.pdf)

**Related Prior Work:** 👉 [View my thesis on ECB Narrative Tone & Market Impact](https://shreyasxi.github.io/ecb-narrative-tone-market-impact-thesis/)

---


## 📌 Overview
This repository contains my completed technical assessment for the Pre-Doctoral Research Assistant position at the LSE Centre for Macroeconomics. The project involved handling complex macroeconomic data, critically evaluating research methodologies, and solving dynamic programming problems computationally.

The assessment consists of three main components:

1. **Empirical Analysis (Task A):** Analyzing Total Factor Productivity (TFP) growth across five European economies (2000-2023). It documents procyclical productivity patterns and a positive cross-sectional relationship between TFP and export intensity using fixed-effects regressions on Eurostat national accounts data.

2. **Research Evaluation (Task B):** Proposing methodological improvements to Parle (2022) on ECB communication tone, specifically suggesting multi-channel extensions and the use of modern transformer-based sentiment models (e.g., FinBERT, CB-LMs).

3. **Macroeconomic Modeling (Task C):** Solving a heterogeneous-agent consumption-savings model with income uncertainty. This involves using Value Function Iteration (VFI) to derive the Euler equation, compute stationary distributions, and calibrate the discount factor to match empirical estimates of the Marginal Propensity to Consume (MPC).

## 📁 Project Structure

```text
lse_macro_assessment/
├── data/
│   ├── raw/              # Original Eurostat downloads, recession.xlsx
│   └── processed/        # Cleaned and merged datasets
├── docs/                 # Final write-up
│   ├── Assessment_Report.pdf
│   └── Assessment_Report.tex
├── macro_analysis.ipynb  # Jupyter Notebook that contains the code
├── output/
│   ├── figures/          # All plots
│   └── tables/           # Descriptive stats, regression results
├── requirements.txt
└── README.md
└── Codes (Task C)        # Codescripts required for the completion of Task C
```

## 🔧 Installation & Replication

1. **Clone the repository:**
   ```bash
   git clone https://github.com/janedoe123/lse-macro-assessment.git
   cd lse-macro-assessment
   ```

2. **Install the required dependencies:**
   This project uses Python 3. Ensure you have it installed, then run:
   ```bash
   pip install -r requirements.txt
   ```

3. **Run the analysis:**
   Open the Jupyter Notebook to view or execute the code:
   ```bash
   jupyter notebook notebooks/macro_analysis.ipynb
   ```
   *Note: The notebook fetches raw national accounts data directly via the Eurostat API, so an active internet connection is required to run those specific cells.*

## Disclaimer
This is a completed technical assessment for a past application. The prompt and original task instructions remain the intellectual property of the LSE Centre for Macroeconomics.