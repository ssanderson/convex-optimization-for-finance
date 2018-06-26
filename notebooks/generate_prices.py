import numpy as np


def gaussian_returns(means, cov, nperiods, seed=None):
    state = np.random.RandomState(seed)
    return state.multivariate_normal(means, cov, size=nperiods)
