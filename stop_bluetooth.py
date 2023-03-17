import subprocess

# 블루투스 서비스 중지
subprocess.run('net stop bthserv', shell=True)
