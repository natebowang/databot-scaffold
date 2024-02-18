import subprocess
from typing import List, Callable
from pipe import select, where


def main(rsync_command: str) -> List[str]:
    rsync = {
        'args': rsync_command,
        'shell': True,
        'stdout': subprocess.PIPE,
        'stderr': subprocess.PIPE,
    }
    output_lines = subprocess.run(**rsync).stdout.decode('utf-8').splitlines()
    # ['*deleting   bot.json.2024-02-16-17',
    # '>f+++++++++ .02cc687f8dd4a4006897201987260610b88c010e-audit.json',
    # '>f.st...... bot.json.2024-02-16-16',
    # '>f+++++++++ bot.json.2024-02-16-19']
    changed_file_line: Callable[[str], bool] = lambda line: line.startswith('>f')
    # ['>f+++++++++ .02cc687f8dd4a4006897201987260610b88c010e-audit.json',
    # '>f.st...... bot.json.2024-02-16-16',
    # '>f+++++++++ bot.json.2024-02-16-19']
    file_name: Callable[[str], str] = lambda line: line.split(' ')[1]
    # ['.02cc687f8dd4a4006897201987260610b88c010e-audit.json',
    # 'bot.json.2024-02-16-16',
    # 'bot.json.2024-02-16-19']
    log_file: Callable[[str], bool] = lambda line: line.startswith('bot.json')
    # ['bot.json.2024-02-16-16',
    # 'bot.json.2024-02-16-19']

    changed_log_file_names = list(output_lines
                                  | where(changed_file_line)
                                  | select(file_name)
                                  | where(log_file)
                                  )

    return changed_log_file_names
