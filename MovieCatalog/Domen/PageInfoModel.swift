//
//  PageInfoModel.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 09.11.2022.
//

import Foundation

struct PageInfoModel: Decodable{
    let pageSize: Int
    let pageCount: Int
    let currentPage: Int
}
