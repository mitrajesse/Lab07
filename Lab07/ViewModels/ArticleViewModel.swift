//
//  ArticleViewModel.swift
//  Lab07
//
//  Created by Jesse Mitra on 10/10/24.
//

import SwiftUI

class ArticleViewModel: ObservableObject {
    @Published var model: Article

    static func createArticle() -> Article {
        return Article(
            title: "How to work with others",
            category: "Employee Relations",
            text: """
            Regardless of what type of job you have, if
            you work with other people you can enjoy the
            benefits that come with getting along with your
            coworkers. Here are 10 tips on how to better get
            along with the people you work with.

            1. Start building relationships from the
            start

            Getting along with your coworkers begins the
            very first day you start a new job. When you
            begin a new position, be sure to focus not only
            on learning your new role but also on meeting
            your colleagues and being friendly. For example,
            if your coworkers all go to lunch together on
            Wednesdays, agree to go along with them or ask to
            join in. This can provide you with quality time
            to meet new people and let your coworkers know
            you’re interested in building relationships with
            them...
            """,
            imageName: "Employees",
            isFavorite: false,
            url: "https://www.indeed.com/career-advice/career-development/how-to-get-along-with-coworkers"
        )
    }
    
    init() {
        self.model = ArticleViewModel.createArticle()
    }

    func markAsFavorite() {
        model.isFavorite = true
    }
}

