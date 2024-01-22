#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf311.gro -r conf311.gro -p topol.top -n index.ndx -o npt311.tpr
gmx mdrun -deffnm npt311

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt311.gro -r npt311.gro -t npt311.cpt -p topol.top -n index.ndx -o umbrella311.tpr
gmx mdrun -deffnm umbrella311


