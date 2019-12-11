import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

plt.figure(figsize=[10, 8])
labels = ['0.0', '', '0.2', '', '0.4', '', '0.6', '', '0.8', '', '1.0']
plt.rcParams.update({'font.size': 32})

y1 = [0.9452, 0.9154, 0.9834, 0.8796, 0.9634]
y2 = [0.5000, 0.6811, 0.7579, 0.5871, 0.5471]
x = [0.2, 0.4, 0.6, 0.8, 1.0]

ax = plt.subplot(111)
ax.scatter(x, y1, color='b')
ax.plot(x, y1, color='b')
ax.scatter(x, y2, color='r')
ax.plot(x, y2, color='r')

plt.xticks(np.linspace(0, 1, 11), labels)
plt.yticks(np.linspace(0, 1, 11))

ax.set_ylabel('F-measure')
ax.set_xlabel('dependency strength')

glm = mpatches.Patch(color='b', label='HAD')
lasso = mpatches.Patch(color='r', label='AD')

plt.legend(handles=[glm, lasso])
#plt.suptitle("Dependency Strength")

plt.show()
