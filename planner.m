clc;
clear;

disp("==============================================================");
disp("     CASH FLOW & BUDGET ANALYSIS TOOL (PERSONAL + CORPORATE)");
disp("==============================================================");

disp("Select Budget Type:");
disp("1. Personal Budget Analysis");
disp("2. Corporate Budget Analysis");
mode = input("Enter choice: ");

%% ================= PERSONAL BUDGET ==========================
if mode == 1

    income = input("Enter monthly income (₹): ");

    disp("Income Stability:");
    disp("1. Fixed");
    disp("2. Variable");
    stability = input("Choice: ");

    disp("Risk Preference:");
    disp("1. Conservative");
    disp("2. Moderate");
    disp("3. Aggressive");
    risk = input("Choice: ");

    disp("Enter monthly expenses (₹)");
    housing = input("Housing / Rent / EMI: ");
    insurance = input("Insurance: ");
    utilities = input("Utilities: ");
    grocery = input("Grocery: ");
    medical = input("Medical: ");
    transport = input("Transport: ");
    lifestyle = input("Lifestyle / Entertainment: ");
    savings = input("Savings / Investments: ");

    % Classification
    fixed = housing + insurance + utilities;
    variable = grocery + medical + transport;
    discretionary = lifestyle;

    % Percentages
    p_fixed = fixed / income * 100;
    p_variable = variable / income * 100;
    p_discretionary = discretionary / income * 100;
    p_savings = savings / income * 100;

    % Benchmarks (Research-backed)
    bench_fixed = [30 40];
    bench_variable = [15 25];
    bench_discretionary = [10 20];
    bench_savings = [15 25];

    if stability == 2
        bench_savings = [20 30];
        bench_fixed = [25 35];
    end

    if risk == 1
        bench_savings = bench_savings + 5;
    elseif risk == 3
        bench_discretionary = bench_discretionary + 5;
    end

    disp(" ");
    disp("------------ PERSONAL CASH FLOW SUMMARY ------------");

    fprintf("Fixed Costs: %.2f%% (Rec: %d–%d%%)\n", p_fixed, bench_fixed);
    fprintf("Variable Costs: %.2f%% (Rec: %d–%d%%)\n", p_variable, bench_variable);
    fprintf("Discretionary: %.2f%% (Rec: %d–%d%%)\n", p_discretionary, bench_discretionary);
    fprintf("Savings Rate: %.2f%% (Rec: %d–%d%%)\n", p_savings, bench_savings);

    disp(" ");
    disp("Key Observations:");
    if p_fixed > bench_fixed(2)
        disp("⚠ High fixed cost exposure");
    end
    if p_savings < bench_savings(1)
        disp("⚠ Savings below recommended level");
    end
    if p_fixed <= bench_fixed(2) && p_savings >= bench_savings(1)
        disp("✔ Healthy personal cash-flow structure");
    end

    disp(" ");
    disp("--------------- INSIGHTS & SUGGESTIONS (PERSONAL) ---------------");
    
    % Fixed cost insight
    if p_fixed > bench_fixed(2)
        disp("Insight: High fixed costs reduce financial flexibility.");
        disp("Suggestion: Consider renegotiating rent/EMI or reducing long-term commitments.");
    elseif p_fixed < bench_fixed(1)
        disp("Insight: Fixed costs are well controlled.");
    end
    
    % Savings insight
    if p_savings < bench_savings(1)
        disp("Insight: Savings rate is below recommended level.");
        disp("Suggestion: Increase savings gradually by 2–5% of income or reduce discretionary spending.");
    elseif p_savings >= bench_savings(1) && p_savings <= bench_savings(2)
        disp("Insight: Savings rate is within a healthy range.");
    else
        disp("Insight: High savings rate provides strong financial resilience.");
        disp("Suggestion: Consider allocating part of savings to higher-return investments if risk appetite allows.");
    end
    
    % Discretionary insight
    if p_discretionary > bench_discretionary(2)
        disp("Insight: Discretionary spending is relatively high.");
        disp("Suggestion: Track lifestyle expenses and cap non-essential spending.");
    end
    
    % Overall assessment
    if p_fixed <= bench_fixed(2) && p_savings >= bench_savings(1)
        disp("Overall Assessment: Personal cash-flow structure is financially sound.");
    else
        disp("Overall Assessment: Cash-flow structure can be improved to reduce risk exposure.");
    end


    % Charts
    figure;
    pie([fixed variable discretionary savings], ...
        {'Fixed','Variable','Discretionary','Savings'});
    title("Personal Expense Composition");

    figure;
    bar([p_fixed p_variable p_discretionary p_savings]);
    hold on;
    errorbar(1:4, ...
        mean([bench_fixed; bench_variable; bench_discretionary; bench_savings],2), ...
        diff([bench_fixed; bench_variable; bench_discretionary; bench_savings],1,2)/2, ...
        'k.');
    hold off;
    xticklabels({'Fixed','Variable','Discretionary','Savings'});
    ylabel("% of Income");
    title("Actual vs Recommended Spending (Personal)");

    figure;
    bar([fixed variable discretionary savings]);
    xticklabels({'Fixed','Variable','Discretionary','Savings'});
    ylabel("Amount (₹)");
    title("Personal Cost Structure");

%% ================= CORPORATE BUDGET =========================
elseif mode == 2

    revenue = input("Enter annual company revenue (₹): ");

    disp("Select Business Stage:");
    disp("1. Stable");
    disp("2. Growth-focused");
    stage = input("Choice: ");

    disp("Enter annual expenses (₹)");
    operations = input("Operations: ");
    hr = input("Human Resources: ");
    admin = input("Administrative Overheads: ");
    marketing = input("Marketing: ");
    rnd = input("Research & Development: ");
    reserves = input("Cash Reserves / Retained Earnings: ");

    fixed_opex = hr + admin;
    variable_opex = operations;
    growth = marketing + rnd;

    p_fixed = fixed_opex / revenue * 100;
    p_variable = variable_opex / revenue * 100;
    p_growth = growth / revenue * 100;
    p_reserves = reserves / revenue * 100;

    % Benchmarks (McKinsey / PwC / Gartner ranges)
    bench_fixed = [15 25];
    bench_variable = [20 40];
    bench_growth = [10 25];
    bench_reserves = [5 15];

    if stage == 2
        bench_growth = [15 35];
        bench_reserves = [5 10];
    end

    disp(" ");
    disp("------------ CORPORATE COST STRUCTURE SUMMARY ------------");

    fprintf("Fixed OPEX: %.2f%% (Rec: %d–%d%%)\n", p_fixed, bench_fixed);
    fprintf("Variable OPEX: %.2f%% (Rec: %d–%d%%)\n", p_variable, bench_variable);
    fprintf("Growth Spend: %.2f%% (Rec: %d–%d%%)\n", p_growth, bench_growth);
    fprintf("Cash Reserves: %.2f%% (Rec: %d–%d%%)\n", p_reserves, bench_reserves);

    disp(" ");
    disp("Key Observations:");
    if p_fixed > bench_fixed(2)
        disp("⚠ High fixed overheads reduce operating flexibility");
    end
    if p_reserves < bench_reserves(1)
        disp("⚠ Low cash reserves increase liquidity risk");
    end
    if p_growth >= bench_growth(1)
        disp("✔ Growth investment aligned with expansion strategy");
    end


    disp(" ");
    disp("--------------- INSIGHTS & SUGGESTIONS (CORPORATE) ---------------");
    
    % Fixed overhead insight
    if p_fixed > bench_fixed(2)
        disp("Insight: High fixed overheads may constrain operational flexibility.");
        disp("Suggestion: Review administrative and HR costs to improve operating leverage.");
    elseif p_fixed < bench_fixed(1)
        disp("Insight: Lean fixed cost structure enhances flexibility.");
    end
    
    % Variable OPEX insight
    if p_variable > bench_variable(2)
        disp("Insight: Variable operating costs are relatively high.");
        disp("Suggestion: Evaluate process efficiency and cost optimization opportunities.");
    end
    
    % Growth spend insight
    if p_growth < bench_growth(1)
        disp("Insight: Growth investment is below industry benchmarks.");
        disp("Suggestion: Consider increasing marketing or R&D spend to support long-term growth.");
    elseif p_growth > bench_growth(2)
        disp("Insight: Aggressive growth spending detected.");
        disp("Suggestion: Ensure returns on growth investments are tracked and justified.");
    end
    
    % Reserves insight
    if p_reserves < bench_reserves(1)
        disp("Insight: Low cash reserves increase liquidity risk.");
        disp("Suggestion: Strengthen retained earnings to improve financial resilience.");
    elseif p_reserves >= bench_reserves(1)
        disp("Insight: Adequate cash reserves support business stability.");
    end
    
    % Overall assessment
    if p_reserves >= bench_reserves(1) && p_fixed <= bench_fixed(2)
        disp("Overall Assessment: Corporate cost structure appears balanced and resilient.");
    else
        disp("Overall Assessment: Cost structure adjustments recommended to reduce financial risk.");
    end


    % Charts
    figure;
    pie([fixed_opex variable_opex growth reserves], ...
        {'Fixed OPEX','Variable OPEX','Growth Spend','Reserves'});
    title("Corporate Cost Composition");

    figure;
    bar([p_fixed p_variable p_growth p_reserves]);
    hold on;
    errorbar(1:4, ...
        mean([bench_fixed; bench_variable; bench_growth; bench_reserves],2), ...
        diff([bench_fixed; bench_variable; bench_growth; bench_reserves],1,2)/2, ...
        'k.');
    hold off;
    xticklabels({'Fixed','Variable','Growth','Reserves'});
    ylabel("% of Revenue");
    title("Actual vs Recommended Cost Structure (Corporate)");

    figure;
    bar([fixed_opex variable_opex growth reserves]);
    xticklabels({'Fixed OPEX','Variable OPEX','Growth','Reserves'});
    ylabel("Amount (₹)");
    title("Corporate Cost Structure Breakdown");

else
    disp("Invalid selection");
end

disp(" ");
disp("Analysis complete. Use insights to improve financial resilience and decision-making.");
