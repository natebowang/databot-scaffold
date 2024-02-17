# rsync: https://serverfault.com/questions/618735/how-to-output-a-list-of-changed-files-from-rsync
# jq one line a object file
# TODO: install json importer https://stackoverflow.com/a/70357119 # 如果记录多余1000会拆分成多个INSERT
# https://konbert.com/blog/import-json-into-postgres-using-copy

import subprocess

shell = {
  'shell': True,
  'stdout': subprocess.PIPE,
  'stderr': subprocess.PIPE,
}

result = subprocess.run('echo $ENV_NAME', **shell)

print(result.stdout.decode('utf-8'))
