# jq one line a object file
# TODO: install json importer https://stackoverflow.com/a/70357119 # 如果记录多余1000会拆分成多个INSERT
# https://konbert.com/blog/import-json-into-postgres-using-copy

import os
import sync_log

is_prod: bool = os.environ['ENV_NAME'] == 'prod'
rsync_prod: str = 'todo'
rsync_local: str = 'rsync -ai --delete ../bot/log/ ./log/'
rsync_command: str = rsync_prod if is_prod else rsync_local

changed_log_file_names = sync_log.main(rsync_command)
