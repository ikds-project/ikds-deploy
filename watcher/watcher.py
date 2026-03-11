import time
from pathlib import Path
import subprocess

class DirectoryPoller:
  def __init__(self, directory, callback, interval=2):
    """
    :param directory: Directory to monitor
    :param callback: Function to call when a new file appears
    :param interval: Polling interval in seconds
    """
    self.directory = Path(directory)
    self.callback = callback
    self.interval = interval
    self._known_files = set()

    if not self.directory.exists():
      raise ValueError(f"Directory does not exist: {directory}")

    # Initialize known files
    self._known_files = set(self.directory.iterdir())

  def start(self):
    """Start polling the directory for new files."""
    print(f"Watching directory: {self.directory}")

    while True:
      print(f"Watching directory: {self.directory}")
      current_files = set(self.directory.iterdir())

      new_files = current_files - self._known_files
      for file_path in new_files:
        if file_path.is_file():
          self.callback(str(file_path))

      self._known_files = current_files
      time.sleep(self.interval)


def process_file(filename):
  print(f"New file detected: {filename}")

  # src_file = Path(filename)
  # dst_file = ROOT_DIR / "scripts/virtuoso/data/rdf" / src_file.name
  #
  # src_file.rename(dst_file)

  # import_data(dst_file.name)
  # run()
  result = subprocess.run(['./virtuoso_config.sh'],
                          capture_output=True, text=True,
                          check=True)
  print(result.stdout)  # Script output
  print(result.stderr)  # Errors if any

DirectoryPoller(
    directory=str("/rdf"),
    callback=process_file,
    interval=3
).start()

