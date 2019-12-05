import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

plt.figure(figsize=[10,8])
#labels = ['Gaussian', 'Gamma', 'Poisson', 'D']
labels = ['B-Ga', 'B-P', 'Ga-P', 'P-G', 'G-Ga', 'G-B']
plt.rcParams.update({'font.size': 22})

y = [[0.95,0.69],[0.92,0.22],[0.93,0.25],[0.81,0.18],[0.85,0.34],[0.91,0.27]]
ax = plt.subplot(111)
ax.bar([1,1.2], y[0], width=0.2, color=['b','r'], align='center')
ax.bar([1.5,1.7], y[1], width=0.2, color=['b','r'], align='center')
ax.bar([2,2.2], y[2], width=0.2, color=['b','r'], align='center')
ax.bar([2.5,2.7], y[3], width=0.2, color=['b','r'], align='center')
ax.bar([3,3.2], y[4], width=0.2, color=['b','r'], align='center')
ax.bar([3.5,3.7], y[5], width=0.2, color=['b','r'], align='center')
plt.xticks([1.1,1.6,2.1,2.6,3.1,3.6], labels)
#plt.xticks([1.1,1.6,2.1], labels)

plt.yticks(np.linspace(0,1,11))
ax.set_ylabel('F-measure')
glm = mpatches.Patch(color='b', label='HAD')
lasso = mpatches.Patch(color='r', label='AD')

plt.legend(handles=[glm,lasso])

plt.show()
