import matplotlib.pyplot as plt
import numpy as np


def plot_bar(path, fig=None, ax=None, show=False):
    data = np.loadtxt(path, skiprows=17)
    lambda_vdw, deltaG, deltaG_std = data[:, 0] / 20, data[:, 1], data[:, 2]

    if all(x is None for x in {fig, ax}):
        fig, ax = plt.subplots()
        ax.set_xlabel('$\lambda_{vdW}$')
        ax.set_ylabel('$\Delta G$ $[k_{B}T]$')

    ax.bar(lambda_vdw, deltaG, width=0.02, color='blue', label='Free energy differences')
    ax.errorbar(lambda_vdw, deltaG, yerr=deltaG_std, linestyle="")

    fig.tight_layout()

    if show:
        plt.show()
    else:
        return fig, ax


def plot_barint(path, fig=None, ax=None, show=False, save=False):
    data = np.loadtxt(path, skiprows=17)
    lambda_vdw, cum_deltaG = data[:, 0] / 20, data[:, 1]

    if all(x is None for x in {fig, ax}):
        fig, ax = plt.subplots()
        ax.set_xlabel('$\lambda_{vdw}$')
        ax.set_ylabel('$\Delta G$ $[k_{B}T]$')

    ax.bar(lambda_vdw, cum_deltaG, width=0.02, color='red', label='Free energy integral')

    ax.legend()
    fig.tight_layout()

    if save:
        fig.savefig('deltaG.png', dpi=300)

    if show:
        plt.show()
    else:
        return fig, ax


if __name__ == '__main__':
    fig, ax = plot_bar('bar.xvg', show=False)
    plot_barint('barint.xvg', fig=fig, ax=ax, show=True, save=True)
