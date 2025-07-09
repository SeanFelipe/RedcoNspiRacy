#!/bin/bash
title "zomg listener"
export REDC_HOME=`pwd`
export GDX_LIBS_DIR=`pwd`/libs

ruby escu/listener_desktop.rb
