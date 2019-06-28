#! /usr/bin/env python

import argparse
import os
import sys


def main(argv):

  parser = argparse.ArgumentParser(argv)
  parser.add_argument('current_path', action='store')
  parser.add_argument('last_path', nargs='?', default=None, action='store')
  args = parser.parse_args()

  cwd = os.getcwd()
  last_path = args.last_path
  current_path = args.current_path

  path_arr = current_path.split(':')

  if last_path in path_arr:
    path_arr.remove(last_path)

  if cwd not in path_arr:
    path_arr.insert(0, cwd)

  new_path = ':'.join(path_arr)
  print new_path


if __name__ == '__main__':
  argv = sys.argv[1:]
  main(argv)
