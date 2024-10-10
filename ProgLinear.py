x = {}

for i in range(1, (num_vertices + 1)):
    x[i] = modelo.addVar(f"x_{i}", vtype="INTEGER", lb=0, ub=1)

modelo.addCons(x[i + 1] + x[j + 1] <= 1, f"Restricao x{i + 1} x{j + 1}")

modelo.setObjective(quicksum(x[i] for i in range(1, (num_vertices + 1))), sense="maximize")
  