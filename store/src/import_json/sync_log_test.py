import sync_log


def test():
    rsync_command: str = 'rsync -ai --dry-run --delete ' \
                         './src/import_json/mock_log/source/ ' \
                         './src/import_json/mock_log/destination/'

    changed_log_file_names = sync_log.main(rsync_command)

    assert len(changed_log_file_names) == 2
    assert 'bot.json.2024-02-16-16' in changed_log_file_names
    assert 'bot.json.2024-02-16-17' in changed_log_file_names
