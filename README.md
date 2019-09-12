# omnidb
docker images for omnidb, base on centos7.4.  contain  orcale client!!!


xt Release: 2.17.0 - Aug 14, 2019
OmniDB 2.16.0
Release Date: June 13, 2019
Release Notes
New features:
Monitoring Dashboard: Graph monitor unit type
Monitoring Dashboard: New standard units: TPS, WAL Production and Replication Graph
PostgreSQL TreeView: New groups for partitioned and inherited tables
PostgreSQL Debugger Plugin: Support for PostgreSQL running on OSX
Server: Support to run OmniDB on a custom URL path
Snippets: Run Snippet in Connection
Improvements:
UI usability:
Add Connection list in (+) menu of outer tabs
Show red X on tabs only on mouse hover
Color icons in Dark Theme
Release Notes outer tab now stay closed and only open upon next upgrade
Other improvements:
Included procedures in Advanced Object Search for PostgreSQL 11
Important changes:
PostgreSQL Debugger Plugin: Requires a host connection on all platforms
Deployment:
OmniDB server and PostgreSQL debugger plugin packages under Debian PGDG repository (thanks to Christoph Berg @df7cb )
Bug fixes:
Fixed #768: Monitoring - some units fail on a standby server
Fixed #836: SELECT ... INTO is not allowed here
Fixed #845: Partitioned relation indexes
Fixed #938: Password in connection string not used
Fixed #940: Unable to change column width of query results
Fixed #960: Snippet TreeView not rendering properly
Fixed #970: Focus on change Query Tab names
Fixed #981: Updatable chart titles
Fixed #990: Cleanup of inactive web socket clients
Full Documentation: https://omnidb.readthedocs.io

1- Introduction
OmniDB is a web tool that simplifies database management focusing on interactivity, designed to be powerful and lightweight. Check-out some characteristics:

Web Tool: Accessible from any platform, using a browser as a medium
Responsive Interface: All available functions in a single page
Unified Workspace: Different technologies managed in a single workspace
Simplified Editing: Easy to add and remove connections
Safety: Multi-user support with encrypted personal information
Interactive Tables: All functionalities use interactive tables, allowing copying and pasting in blocks
Smart SQL Editor: Contextual SQL code completion
Beautiful SQL Editor: You can choose between many available color themes
Tabbed SQL Editor: Easily add, rename or delete editor tabs
Technologies:

Python (3.6+)
Django
Supported Platforms:

Linux
Windows
OSX
Supported DBMS:

 PostgreSQL
 Oracle
 MySQL / MariaDB
 Firebird
 SQLite
 Microsoft SQL Server
 IBM DB2
OmniDB is designed for easy database management. Here are some features:

Tree view showing database structure


Simple form for table creation and editing
Tables' names
Columns: name, type and nullable
Primary keys and respective columns
Foreign keys with either table and reference columns, including updating rules and removal as well
Indexes


Data management: Add, edit and remove records


SQL Editing
Full-featured SQL Editor with syntax highlighting
SQL code completion for table columns and subquery


SQL code completion with basic contextual information


Visualization of explain plan


PL/pgSQL function debugger (requires a PostgreSQL plugin, please see here)


Show PL/pgSQL debugging session statistics


Monitoring dashboard


Console Tab


SSH Console


Full Dark Theme


Support for external tools available as installable plugins:
pglogical
Postgres-BDR
Postgres-XL


Other features:

Object Properties


Object DDL


Export Data


SQL History


Graphs displaying tables and their relations


Graphs displaying complete ER diagram


Contextual help


Snippet management


2- Installation
2.1- Installation packages
Just go to omnidb.org, download the appropriate file for your operating system and architecture and install it.

You can also install from repositories (as root):

2.2- Debian / Ubuntu repository
IMPORTANT: Currently OmniDB server and PostgreSQL debugger plugin packages can be installed from Debian PGDG repository.

apt install apt-transport-https dirmngr
echo "deb https://dl.bintray.com/wind39/omnidb-deb debian main" > /etc/apt/sources.list.d/omnidb.list
apt-key adv --recv-keys 379CE192D401AB61
apt update

apt install omnidb-app        # for the app
2.3- CentOS 7 / Fedora repository
cat > /etc/yum.repos.d/omnidb.repo <<EOF
[omnidb]
name=omnidb
baseurl=https://dl.bintray.com/wind39/omnidb-rpm
gpgcheck=0
repo_gpgcheck=0
enabled=1
EOF

yum install omnidb-app        # for the app; or
yum install omnidb-server     # for the server; or
yum install omnidb-plugin     # for the plugin
3- From sources
If your purpose is to use OmniDB, we recommend installing latest packages as explained above. But if you are developing for OmniDB, then you can install it from sources, with system-wide pip or user-wide PyEnv:

3.1- On Debian >= 9 with pip
sudo apt install python3-pip
pip3 install pip --upgrade
pip3 install -r requirements.txt
3.2- On Debian/Ubuntu using PyEnv
sudo apt install git make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc

pyenv install 3.6.5
cd OMNIDB_FOLDER
pyenv local 3.6.5

pip install pip --upgrade
pip install -r requirements.txt
3.3- Cloning OmniDB repo
git clone https://github.com/OmniDB/OmniDB
3.4- Running OmniDB from sources
To start OmniDB server, enter into OmniDB/OmniDB folder and type:

python omnidb-server.py -c omnidb.conf
