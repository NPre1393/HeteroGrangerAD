import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

plt.figure(figsize=[10, 8])
labels = ['0', '1', '2', '3', '4', '5']
plt.rcParams.update({'font.size': 32})

y1 = [0.9000, 0.9438, 0.9796, 0.9384, 0.8273]
y2 = [0.9583, 0.7952, 0.4733, 0.8095, 0.7667]
x = [1, 2, 3, 4, 5]

ax = plt.subplot(111)
ax.scatter(x, y1, color='b')
ax.plot(x, y1, color='b')
ax.scatter(x, y2, color='r')
ax.plot(x, y2, color='r')

plt.xticks(np.linspace(0, 5, 6), labels)
plt.yticks(np.linspace(0, 1, 11))
ax.set_ylabel('F-measure')
ax.set_xlabel('nr of dependencies')
glm = mpatches.Patch(color='b', label='HAD')
lasso = mpatches.Patch(color='r', label='AD')

plt.legend(handles=[glm, lasso])
#plt.suptitle("Number of dependencies")

plt.show()
