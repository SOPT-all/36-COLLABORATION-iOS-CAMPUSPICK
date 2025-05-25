# 대학생 SNS 캠퍼스픽 - iOS 🍎 

**36 AT SOPT 합동세미나 캠퍼스픽 이용 플로우 개선 프로젝트**

<div align="left">
    <div>
        <img width="100%" src="https://github.com/user-attachments/assets/b66fbf25-9834-4166-821a-4c4959a2bf78">
    </div>

</div>


</br>


</div>

## 👩🏻‍💻🧑🏻‍💻 Developers
| [김한열](https://github.com/OneTen19) | [김나연](https://github.com/Yeonnies) | [안치욱](https://github.com/KooWihC) |
| :--------: | :--------: | :--------: |
| <img width="200px" src="https://avatars.githubusercontent.com/u/63261054?v=4"/> | <img width="200px" src="https://avatars.githubusercontent.com/u/126739852?v=4"/> | <img width="200px" src="https://avatars.githubusercontent.com/u/124045490?v=4"/> |
| <p align = "center">`개발 환경 세팅` <br/> `네트워크 세팅` <br/> `Club View` | <p align = "center"> `Configure 세팅`<br/> `git ignore 세팅`<br/> `Search View`<br/> | <p align = "center">`커스텀 탭바` <br/> `Home View` <br/> |

</br>


## 😺 Project Flow

<img width="2477" src="https://github.com/user-attachments/assets/5efe2edd-cfbd-47c0-b91e-1422cd3553ee" />

<br/>
<br/>

## 🎬 시연 영상

||홈|동아리|검색|
|:--:|:--:|:--:|:--:|
|GIF|<img src = "https://github.com/user-attachments/assets/0a500768-14b4-42a6-a397-ec03480f8b10" width ="250">|<img src = "https://github.com/user-attachments/assets/ed32968c-684a-45e7-b580-85d5f11dcc79" width ="250">|<img src = "https://github.com/user-attachments/assets/29e4d324-ebfe-498d-9365-af42c7d64b36" width ="250">|

<br/>

## 🧄 Code Convention
[🔗 Code Convention](https://www.notion.so/sopt-official/1ed1e48dd96080dcb00cf00843b465a7?pvs=4)
[⚠️ Issue Convention](https://www.notion.so/sopt-official/268096f1ae7040c2805a8174ae3eadd3?pvs=4)
[🦑 PR Convention](https://www.notion.so/sopt-official/3efb1728a65648b4a1175b20bc5ac05f?pvs=4)
[💬 Commit Convention](https://www.notion.so/sopt-official/f7618f69008b4981b0f0171c4eb7e944?pvs=4)

```
Naming:
- 타입: UpperCamelCase
- 변수/상수: lowerCamelCase
- 약어(URL/ID/API): 대문자

Structure:
- Protocol → extension으로 분리
- import: 내장 먼저, 서드파티는 한 줄 띄움

Image:
- icn_/btn_/img_ 접두어
- snake_case
- SVG 우선

self/강제 언래핑 지양, 긴 View는 extension으로 분리
```

<br/>

## 📁 Foldering
```
📁 Project
├── 📁 Applacation
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   ├── Info.plist
│   └── LaunchScreen.storyboard
├── 📁 Global
│   ├── 📁 Components
│   ├── 📁 Extensions
│   └── 📁 Resources
│       ├── 📁 Fonts
│       └── Assets.xcassets
├── 📁 Network
│   ├── 📁 Base
│   └── 📁 Club
│       ├── 📁 DTO
│       │   ├── 📁 Request
│       │   └── 📁 Response
│       ├── ClubAPI.swift
│       └── ClubService.swift
└── 📁 Presentation
    ├── 📁 Search
    │    ├── 📁 Model
    │    │   └── SearchModel.swift
    │    ├── 📁 View
    │    │   └── SearchClubView.swift
    │    └── 📁 ViewModel
    │        └── SearchClubViewController.swift
    ├── 📁 Home
    │    ├── 📁 Model
    │    │   └── HomeModel.swift
    │    ├── 📁 View
    │    │   └── HomeView.swift
    │    └── 📁 ViewModel
    │        └── HomeViewController.swift
    └── 📁 Club
         ├── 📁 Model
         │   └── ClubModel.swift
         ├── 📁 View
         │   └── ClubView.swift
         └── 📁 ViewModel
             └── ClubViewController.swift
```
<br/>
