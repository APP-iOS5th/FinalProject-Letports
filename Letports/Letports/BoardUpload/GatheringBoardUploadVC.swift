//
//  GatheringBoardUploadVC.swift
//  Letports
//
//  Created by Chung Wussup on 8/9/24.
//

import UIKit


class GatheringBoardUploadVC: UIViewController {
    
    private(set) lazy var navigationView: CustomNavigationView = {
        let cnv = CustomNavigationView(isLargeNavi: .small,
                                       screenType: .smallCreateGathering(btnName: .create))
        
        cnv.delegate = self
        cnv.backgroundColor = .lp_background_white
        cnv.translatesAutoresizingMaskIntoConstraints = false
        return cnv
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.register(GatheringBoardUploadMainTVCell.self, forCellReuseIdentifier: "GatheringBoardUploadMainTVCell")
        tv.register(SeparatorTVCell.self, forCellReuseIdentifier: "SeparatorTVCell")
        tv.register(GatheringBoardUplaodImageTVCell.self, forCellReuseIdentifier: "GatheringBoardUplaodImageTVCell")
        tv.register(GatheringBoardUplaodTitleTVCell.self, forCellReuseIdentifier: "GatheringBoardUplaodTitleTVCell")
        tv.register(GatheringBoardUploadMemCntTVCell.self, forCellReuseIdentifier: "GatheringBoardUploadMemCntTVCell")
        tv.register(GatheringBoardUploadInfoTVCell.self, forCellReuseIdentifier: "GatheringBoardUploadInfoTVCell")
        tv.register(GatheringBoardUploadQuestionTVCell.self, forCellReuseIdentifier: "GatheringBoardUploadQuestionTVCell")
        tv.separatorStyle = .none
        tv.backgroundColor = .lp_background_white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private var viewModel: GatheringBoarduploadVM
    
    
    init(viewModel: GatheringBoarduploadVM) {
        self.viewModel = GatheringBoarduploadVM()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    //MARK: - SetupUI
    private func setupUI() {
        self.view.backgroundColor = .lpBackgroundWhite
        
        [navigationView, tableView].forEach {
            self.view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    
    
}

extension GatheringBoardUploadVC: CustomNavigationDelegate {
    func smallRightButtonDidTap() {
        
    }
    
    func sportsSelectButtonDidTap() {
        
    }
    
    func backButtonDidTap() {
        self.dismiss(animated: true)
    }
}

extension GatheringBoardUploadVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getCellCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.viewModel.getCellTypes()[indexPath.row] {
            
        case .main:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GatheringBoardUploadMainTVCell", for: indexPath) as? GatheringBoardUploadMainTVCell {
                return cell
            }
        case .separator:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SeparatorTVCell", for: indexPath) as? SeparatorTVCell {
                cell.configureCell(height: 3)
                return cell
            }
        case .uploadImage:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GatheringBoardUplaodImageTVCell", for: indexPath) as? GatheringBoardUplaodImageTVCell {
                
                cell.delegate = self
                return cell
            }
        case .gatherName:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GatheringBoardUplaodTitleTVCell", for: indexPath) as? GatheringBoardUplaodTitleTVCell {
                return cell
            }
        case .gatherMemberCount:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GatheringBoardUploadMemCntTVCell", for: indexPath) as? GatheringBoardUploadMemCntTVCell {
                return cell
            }
        case .gatherInfo:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GatheringBoardUploadInfoTVCell", for: indexPath) as? GatheringBoardUploadInfoTVCell {
                return cell
            }
        case .gatherQuestion:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GatheringBoardUploadQuestionTVCell", for: indexPath) as? GatheringBoardUploadQuestionTVCell {
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}


extension GatheringBoardUploadVC: UploadImageDelegate {
    func didTapUploadImage() {
        print("did Tap Upload Image")
    }
}
