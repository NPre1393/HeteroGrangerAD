import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

plt.figure(figsize=[10, 8])

labels = ['', '', '200', '', '400', '', '600', '', '800', '', '1000', '', '1200', '', '1400', '', '1600', '', '1800', '', '2000']
plt.rcParams.update({'font.size': 32})

y1 = [0.9634, 0.9244, 0.9324, 0.8972, 0.8984, 0.8962, 0.9179, 0.9255, 0.8961, 0.8786]
y2 = [0.6240, 0.4333, 0.7739, 0.7335, 0.6934, 0.7441, 0.5841, 0.6407, 0.5698, 0.7889]
x = np.linspace(200, 2000, 10)

ax = plt.subplot(111)
ax.scatter(x, y1, color='b')
ax.plot(x, y1, color='b')
ax.scatter(x, y2, color='r')
ax.plot(x, y2, color='r')

plt.xticks(np.linspace(0, 2000, 21), labels)
plt.yticks(np.linspace(0, 1, 11))
ax.set_ylabel('F-measure')
ax.set_xlabel('feature length')

glm = mpatches.Patch(color='b', label='HAD')
lasso = mpatches.Patch(color='r', label='AD')

plt.legend(handles=[glm, lasso])
#plt.suptitle("Feature Length")

plt.show()
