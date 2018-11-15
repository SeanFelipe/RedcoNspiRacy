title run
export ZOMG_DESKTOP=true
export GDX_LIBS_DIR=$HOME/srg/zomg/libs
#START_DIR=./alt/25apr-ship-moving-around
#START_DIR=./alt/18oct18-resurrecting-zomg
START_DIR=src/
cd $START_DIR && jruby desktop.rb
