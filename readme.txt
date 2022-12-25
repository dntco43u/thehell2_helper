TH2 설정
  TH2 폴더의 config.ini set fullscreen 옵션 on 권장 (전체화면/창 mode일 때 좌표 동일)
  TH2 폴더의 config.ini set screenwidth,screenheight 1280x720 권장, 본인 화면 좌표를 따서 config.json에 입력하면 다른 해상도도 가능

비고
  관리자 권한 요구 (매크로 동작 시 사용자 입력 차단을 위해)
  (엘리멘탈리스트만 해봐서) 현재 엘리멘탈리스트용으로 셋팅됨
  **아이템 스왑 시 적으로부터 공격 받거나 무리한 연타 시 아이템 삭제됨
  아이템 스왑 명령 시 스왑 직전 밀리초 단위로 세이브 백업 파일 생성
  소스 수정과 재배포 자유롭게 가능

config.json 수정 후 적용 필요
  common.theHell2Path: 더헬2 폴더
  memory.heal.enable: 1:on (default), 0:off
  memory.heal.lifeRatio: 회복할 비율(%)
  memory.heal.manaRatio: 회복할 비율(%)
  memory.heal.lifeShortcut: 단축키 (소스 수정 필요)
  memory.heal.manaShortcut: 단축키 or "potion" (소스 수정 필요)
  memory.heal.term: life와 mana 체크 빈도 ms단위 1000 (default)
  memory 하위 값 중 address, offset은 버전 변경 시 맞는 주소값 찾아서 바꿀 것
  preset 기본적으로 4개가 있지만 원하는 만큼 늘리고 단축키 추가 가능, 스왑 아이템은 총 10개이며 아이템당 무기 슬롯 변경 가능
  preset.enable: 0:off (default), 1: on
  preset.activeSlot: 0:off (default), 1|2|3이면 해당 슬롯으로 스왑
  preset.order: 스왑 순서 (변경 가능)
  preset.position: 스왑할 아이템의 인벤토리 위치 인벤토리 좌상단 = [1, 1] / 우 하단 = [10, 7] **정확하게 기입 필요
TH2 폴더의 config.ini set fullscreen 옵션 on 권장 (전체화면/창 mode일 때 좌표 동일)
TH2 폴더의 config.ini set screenwidth,screenheight 1280x720 권장, 본인 화면 좌표를 따서 config.json에 입력하면 다른 해상도도 가능

기본 엘리멘탈리스트 키 (추천)
  f1: 플레임 링
  f2: 라이트닝 링
  f3: 파이어 월
  f4: 라이트닝 월
  f5: 마나실드
  f6: 리플렉트
  f7: 힐링
  f8: 퓨리 (preset용, 적으로부터 공격 받지 않는 안전 상황일 때)
  q:  프리징 볼
  w:  파이어 블라스트
  e:  볼 라이트닝
  r:  홀리 볼트
  t:  플래시
  y:  아케인 스타
  a:  포스 웨이브
  s:  엘리멘탈
  d:  텔레키네시스
  f:  텔레포트
  g:  골렘
  h:  골렘 (preset용, 적으로부터 공격 받지 않는 안전 상황일 때)
  z:  프로스트 노바
  x:  파이어 노바
  c:  라이트닝 노바
  v:  홀리 노바
  b:  아케인 노바

매크로 동작 키
  h: preset1로 아이템 스왑 후 골렘 시전 이후 원복 (config.json 수정 후 적용 필요)
  f8: preset2로 아이템 스왑 후 퓨리 시전 이후 원복 (config.json 수정 후 적용 필요)
  f9: 아이템 스왑 preset1 토글 (config.json 수정 후 적용 필요)
  f10: 아이템 스왑 preset2 토글 (config.json 수정 후 적용 필요)
  f11: 아이템 스왑 preset3 토글 (config.json 수정 후 적용 필요)
  f12: 아이템 스왑 preset4 토글 (config.json 수정 후 적용 필요)
  alt+q: cain 좌표로 이동 후 identify all
  alt+w: griswold 좌표로 이동 후 repair all
  alt+e: gillian 좌표로 이동
  alt+r: wirt 좌표로 이동
  alt+t: adria 좌표로 이동 후 recharge all
  alt+y: pepin 좌표로 이동
  alt+a: crypt 좌표로 이동
  alt+s: abyss 좌표로 이동
  alt+d: hell 좌표로 이동
  alt+f: cave 좌표로 이동
  alt+g: catacomb 좌표로 이동
  alt+h: church 좌표로 이동
  alt+z: test (개발/수정용)
  alt+x: portal 좌표로 이동
  `: 아이템 정리 (config.json 수정 후 적용 필요)
        config.json moveItemBelt에 원하는 이름과 옵션을 기재
        예) ["potion", "mana"], ["holy", "water"] =  마나 포션 풀 마나 포션, 홀리 워터, 풀 홀리워터를 벨트에 채움 
        config.json moveItemDrop에 원하는 이름과 옵션을 기재
        예) ["gold"], ["relict"], ["repair"], ["potion", "healing"] = 골드, 모든 렐릭, 리페어 오일 x, 힐링 포션, 풀 힐링 포션을 버림
  alt+v: 포션 8개 구입
  alt+b: 그리스올드 오토갬블 (config.json 수정 후 적용 필요, thehell2_trainer.exe 돈 고정 옵션 필요) 
        config.json memory.buyItem.partDescription에 원하는 이름과 옵션을 기재
        예) ["amulet", "replenishing", "wisdom"] = replenishing amulet of wisdom
            ["amulet", "% to mana regeneration", "+24 to magic"] = replenishing amulet of wisdom
            ["% to mana regeneration", "+24 to magic"] = replenishing (all items) of wisdom
            ["+24 to magic"] = (all items) of wisdom
  ctrl+shift+1: 게임 새로 시작 (config.json 수정 후 적용 필요 common.difficulty)
  ctrl+shift+2: 게임 재시작 (config.json 수정 후 적용 필요 common.difficulty, new game이 가능한 마을에서만 가능)
  ctrl+shift+8: TH2 save file 백업 (실행 시간에 따른 건당 생성)
                예) c:\Users\사용자 계정\Documents\thehell2\save_mp\20210219204903\에 백업
  ctrl+shift+0: config.json 생성 및 초기화 (ahk 소스 파일 기반)
  ctrl+shift+p: 프로그램 멈춤
  ctrl+shift+r: 프로그램 재시작 (config.json 수정 후 적용)
  ctrl+shift+x: 프로그램 종료
  ctrl+shift+9: 좌표 test (개발/수정용)
  ctrl+shift+q: 좌표 픽셀 정보 출력 (개발/수정용)