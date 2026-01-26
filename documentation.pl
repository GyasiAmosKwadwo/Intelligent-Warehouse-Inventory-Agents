/*
# Intelligent Warehouse Inventory Agents

## 1. Project Background
In modern warehouses, keeping track of inventory is critical. A warehouse may have hundreds of products, and managers need to:
*   Ensure stock levels are adequate.
*   Avoid stockouts.
*   Decide when to reorder products.
*   Optimize inventory based on demand.

Doing this manually is slow and error-prone. Intelligent agents can automate these decisions efficiently.

---

## 2. Project Aim
The aim of this project is to implement four types of intelligent agents that manage warehouse inventory by:
*   Monitoring stock levels.
*   Deciding when to reorder products.
*   Maintaining internal knowledge of inventory.
*   Making decisions based on goals and utility.

---

## 3. Environment Description
**Warehouse Inventory Environment**
*   **Objects**: Items (e.g., Apple, Banana, Orange)
*   **Sensors**: Stock levels, incoming/outgoing orders
*   **Actions**: Add stock, remove stock, reorder items
*   **Constraints**: Minimum stock threshold = 10
*   **Goals**: Keep stock above threshold for all items

---

## 4. Agents in the Environment

### 1. Simple Reflex Agent
*   **Behavior**: Acts only on current stock.
*   **Rule**: If `stock < threshold` → **Reorder**.

### 2. Model-Based Reflex Agent
*   **Behavior**: Remembers past stock levels.
*   **Mechanism**: Uses internal state to make decisions based on history.

### 3. Goal-Based Agent
*   **Behavior**: Tries to achieve a goal (`stock >= threshold`).
*   **Action**: Reorders only if the goal is not currently met.

### 4. Utility-Based Agent
*   **Behavior**: Chooses actions based on a numerical utility score.
*   **Formula**: `Utility = stock - threshold`
*   **Logic**: Higher utility indicates a better stock situation.

---

## 5. Test Cases / Example Scenarios

| Agent Type | Input (Item, Stock) | Expected Output |
| :--- | :--- | :--- |
| **Simple Reflex** | `simple_reflex(apple, 5)` | Reorder apple |
| **Simple Reflex** | `simple_reflex(banana, 15)` | banana stock is sufficient |
| **Model-Based** | `update_stock(apple, 5)` -> `model_based_reflex(apple)` | Reorder apple |
| **Goal-Based** | `update_stock(orange, 8)` -> `goal_based_agent(orange)` | Reorder orange |
| **Utility-Based** | `update_stock(mango, 7)` -> `utility_agent(mango)` | Reorder mango, utility = -3 |

---

## 6. Presentation Guide

**Introduction**
> "In warehouses, managing inventory manually is slow. Our agents automate stock monitoring."

**Environment**
> "We have items, stock levels, and a threshold of 10 units."

**Agent Explanations**
1.  **Simple Reflex**: Reacts immediately to low stock.
2.  **Model-Based**: Remembers stock history.
3.  **Goal-Based**: Acts to achieve a target stock level.
4.  **Utility-Based**: Chooses the best action based on a numeric score.

**Demo**
Run a query in the terminal:
```prolog
?- simple_reflex(apple, 5).
% Output: "Reorder apple"
```
This demonstrates how the agent works in real-time.

**Conclusion**
> "Each agent type demonstrates increasing intelligence — from reactive to goal-directed to utility-based decision-making."
*/