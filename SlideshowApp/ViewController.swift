//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 伊藤嵩 on 2019/11/23.
//  Copyright © 2019 Shu Ito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var images: [UIImage] = []
    
    func appendImages (_ index: Int) -> UIImage? {
    
    images.append(UIImage(named: "ai_deepfake_t")!)         //[0]
    images.append(UIImage(named: "smart_speaker_tv_talk")!) //[1]
    images.append(UIImage(named: "smartphone_darkmode")!)   //[2]
        
        return images[index]
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //配列に値の設定
        //画像が表示されることは判明
        imageView.image = appendImages(0)
        
    }
    
    //配列の添字の枠
    var nowImagesIndex = 0
    //UIImageviewに配列をセット
    func setUIImageView(){
        imageView.image = images[nowImagesIndex]
    }
    
    //進むボタン
    @IBAction func Go(_ sender: Any) {
        //ViewdidloadのappendImagesで配列に値は入っている状態
        //images.countで 配列の数を取得
        if nowImagesIndex < images.count - 1  {
            nowImagesIndex += 1
            setUIImageView()
        } else {
            nowImagesIndex = 0
            setUIImageView()
        }
        
      }
    //戻るボタン
    @IBAction func Back(_ sender: Any) {
        if nowImagesIndex < images.count - 1 {
            nowImagesIndex -= 1
            setUIImageView()
        }else{
            nowImagesIndex = 2
            setUIImageView()
        }
    }
    
    //スライドショータイマー
    var timer: Timer!
    
    //#selectorで呼び出される定期的に実行される関数
    @objc func updateTimer(_ timer: Timer){
        
        if nowImagesIndex < images.count - 1  {
            nowImagesIndex += 1
            setUIImageView()
        } else {
            nowImagesIndex = 0
            setUIImageView()
        }
        
    }
    
    
    @IBOutlet weak var GoOutlet: UIButton!
    @IBOutlet weak var BackOutlet: UIButton!
    //再生/停止ボタン
    @IBAction func PlayStop(_ sender: UIButton) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ
        if self.timer == nil {
        //timeInterval:ループなら間隔,1度きりなら発動までの秒数
        //target:メソッドを持つオブジェクト
        //selector:実行するメソッド
        //userInfo:オブジェクトに付ける値
        //repeats:繰り返し実行するかどうか
        //定期的に実行されるタイマーを作成、始動
        self.timer = Timer.scheduledTimer(timeInterval: 2,target: self,selector: #selector(updateTimer(_:)) ,userInfo: nil,repeats: true)
        
        //進むボタンと戻るボタンのタップ無効化
        GoOutlet.isEnabled = false
        BackOutlet.isEnabled = false
        
        //ボタンの表記を再生→停止へ
        sender.setTitle("停止", for: .normal)
        }else{
        //進むボタンと戻るボタンのタップ有効化
            GoOutlet.isEnabled = true
            BackOutlet.isEnabled = true
            
        self.timer.invalidate()
        //ボタンの表記を停止→再生へ
        sender.setTitle("再生", for: .normal)
        //タイマーを空にする
        self.timer = nil
        }
    }
    
    
    //segueにて画面遷移を設定
    
    //２画面目から１画面目へ戻る
    @IBAction func unwind(_ segue: UIStoryboardSegue){
      
    }
    
    //遷移先のimageViewに値を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のExpansionViewControllerのインスタンスを取得する
        // 変数:遷移先ViewController型 = segue.destination as! 遷移先ViewController型
       let expansionViewController : ExpansionViewController = segue.destination as! ExpansionViewController
       
        //遷移先で宣言している変数に値を設定
        expansionViewController.expansionImage = images[nowImagesIndex]
        self.timer.invalidate()
    }
    


}
