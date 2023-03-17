import subprocess

# 블루투스 서비스 재시작
subprocess.run('net stop bthserv', shell=True)
subprocess.run('net start bthserv', shell=True)

#
p = subprocess.run(['reg', 'query', 'HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Enum\\USB', '/s', '/f', 'VID_XXXX&PID_XXXX'], capture_output=True, text=True)


# 블루투스 동글 연결 재설정
subprocess.run('devcon.exe findall * | find "ROOT\BLUETOOTH" > bt.txt', shell=True)
with open('bt.txt', 'r') as f:
    lines = f.readlines()
    for line in lines:
        if '인텔(R) 무선 Bluetooth(R)' in line:
            hwid = line.split(' ')[-1].strip()
            subprocess.run(f'devcon.exe restart "{hwid}"', shell=True)

# 임시 파일 제거
subprocess.run('del bt.txt', shell=True)