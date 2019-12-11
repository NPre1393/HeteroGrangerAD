import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

plt.figure(figsize=[10, 8])
labels = ['0', '1', '2', '3', '4', '5']
plt.rcParams.update({'font.size': 32})

y1 = [0.9483, 0.9734, 0.9658, 0.9654, 1.0000]
y2 = [0.7834, 0.9950, 0.8235, 0.9583, 0.7952]
x = [1, 2, 3, 4, 5]

ax = plt.subplot(111)
ax.scatter(x, y1, color='b')
ax.plot(x, y1, color='b')
ax.scatter(x, y2, color='r')
ax.plot(x, y2, color='r')

plt.xticks(np.linspace(0, 5, 6), labels)
plt.yticks(np.linspace(0, 1, 11))
ax.set_ylabel('F-measure')
ax.set_xlabel('anomalous features')
glm = mpatches.Patch(color='b', label='HAD')
lasso = mpatches.Patch(color='r', label='AD')

plt.legend(handles=[glm, lasso])
#plt.suptitle("Number of anomalous features")

plt.show()
