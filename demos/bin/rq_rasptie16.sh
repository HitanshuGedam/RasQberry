#!/bin/bash
#
echo; echo; echo "Raspberry-Tie 16 Qubit Demo"
#source ~/rasqberry/bin/activate
cd ~

if [ ! -d quantum-raspberry-tie ]; then
  git clone https://github.com/KPRoche/quantum-raspberry-tie;
fi

cd quantum-raspberry-tie

if [  ! -f raspberry-tie-isrunning ]; then
  [ ! -f /home/pi/.rq_no_messages ] && whiptail --msgbox "Starting Rqapberry-Tie Demo ${1}" 20 60 1
  nohup python3 QuantumRaspberryTie.qiskit.py $1 expt16.qasm & # 16 Qubit example
  echo $! > raspberry-tie-isrunning
else
   kill -15 `cat raspberry-tie-isrunning`
   rm raspberry-tie-isrunning
   /home/pi/.local/bin/clear_sense.py
fi