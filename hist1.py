import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

plt.figure(figsize=[10, 8])
labels = ['Gamma', 'Gaussian', 'Poisson', 'Bernoulli']
plt.rcParams.update({'font.size': 32})

y = [[0.9195, 0.6059], [0.9432, 0.7894], [0.8623, 0.5842], [0.8142, 0.4922]]
ax = plt.subplot(111)
ax.bar([1, 1.2], y[0], width=0.2, color=['b', 'r'], align='center')
ax.bar([1.5, 1.7], y[1], width=0.2, color=['b', 'r'], align='center')
ax.bar([2, 2.2], y[2], width=0.2, color=['b', 'r'], align='center')
ax.bar([2.5, 2.7], y[3], width=0.2, color=['b', 'r'], align='center')
plt.xticks([1.1, 1.6, 2.1, 2.6], labels)

plt.yticks(np.linspace(0, 1, 11))
ax.set_ylabel('F-measure')
glm = mpatches.Patch(color='b', label='HAD')
lasso = mpatches.Patch(color='r', label='AD')

plt.legend(handles=[glm, lasso])

plt.show()
