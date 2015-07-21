# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
# PostgreSQL

# Installed from source code
#export PGVERSION=9.6dev
export PGVERSION=9.5dev
#export PGVERSION=9.4.1
#export PGVERSION=9.4.0
#export PGVERSION=9.3.6
#export PGVERSION=9.3.5
#export PGVERSION=9.3.3
#export PGVERSION=9.2.10
#export PGVERSION=9.2.9
#export PGVERSION=9.2.8
#export PGVERSION=9.1.15
#export PGVERSION=9.1.14
#export PGVERSION=9.0.19
#export PGVERSION=9.0.18
#export PGVERSION=8.4.22
#export PGVERSION=8.4.5
#export PGVERSION=8.3.23
#export PGVERSION=8.2.23
export POSTGRES_HOME=/usr/local/pgsql/$PGVERSION

# Installed from RPM
#export PGVERSION=9.4
#export PGVERSION=9.3
#export PGVERSION=9.2
#export PGVERSION=9.1
#export PGVERSION=9.0
#export PGVERSION=9.0
#export PGVERSION=9.0
#export POSTGRES_HOME=/usr/pgsql-$PGVERSION

export PGLIB=$POSTGRES_HOME/lib
export PGDATA=/home/postgres/pg_data/$PGVERSION
export MANPATH="$MANPATH":$POSTGRES_HOME/share/man
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"$PGLIB":/usr/local/lib

export PATH=$POSTGRES_HOME/bin:$HOME/bin:$PATH


# Oracle Client
export ORACLE_HOME=/usr/lib/oracle/12.1/client64
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export TNS_ADMIN=$ORACLE_HOME/network/admin/
export ORACLE_INCLUDE=/usr/include/oracle/12.1/client64

# pg_rman
export BACKUP_PATH=/home/postgres/pg_data/backup

# syncdb
export SYNCDB_HOME=/home/postgres/syncdb
export PATH=$SYNCDB_HOME/bin:$PATH

# GitHub
unset SSH_ASKPASS
