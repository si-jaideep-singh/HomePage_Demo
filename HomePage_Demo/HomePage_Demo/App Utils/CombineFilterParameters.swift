//
//  CombineFilterParameters.swift
//  Lucknow Super Giants
//
//  Created by Valentine Miranda on 02/03/23.
//

import Foundation

struct CombineFilterParameters {
    static func combineEntities(defaultValue: String? = nil, filters: [FilterValue]) -> String {
        var entities = [String]()
        if let defaultValues = defaultValue?.split(separator: ",").map({ "\($0)" }) {
            entities.append(contentsOf: defaultValues)
        }
        
        filters.forEach { filterValue in
            if let allEntity = filterValue.entities?.split(separator: ",").map({ "\($0)" }) {
                entities.append(contentsOf: allEntity)
            }
        }
        
        let entity = entities.sorted().joined(separator: ",")
        return entity
    }
    
    static func combineOtherent(defaultValue: String? = nil, filters: [FilterValue]) -> String {
        var otherent = [String]()
        if let defaultValues = defaultValue?.split(separator: ",").map({ "\($0)" }) {
            otherent.append(contentsOf: defaultValues)
        }
        
        filters.forEach { filterValue in
            if let allOtherent = filterValue.otherent?.split(separator: ",").map({ "\($0)" }) {
                otherent.append(contentsOf: allOtherent)
            }
        }
        
        let otherents = otherent.sorted().joined(separator: ",")
        return otherents
    }
    
    static func combineExclent(defaultValue: String? = nil, filters: [FilterValue]) -> String {
        var exclents = [String]()
        if let defaultValues = defaultValue?.split(separator: ",").map({ "\($0)" }) {
            exclents.append(contentsOf: defaultValues)
        }
        
        filters.forEach { filterValue in
            if let allExclent = filterValue.exclent?.split(separator: ",").map({ "\($0)" }) {
                exclents.append(contentsOf: allExclent)
            }
        }
        
        let exclent = exclents.sorted().joined(separator: ",")
        return exclent
    }
    
    static func setFilterListingURL(entities: String?, otherent: String?, exclent: String?, listingURL: String, filters: [FilterValue]?) -> String? {
        guard let filters = filters else { return listingURL }
        
        let combinedEntities = CombineFilterParameters.combineEntities(defaultValue: entities, filters: filters)
        let combinedOtherent = CombineFilterParameters.combineOtherent(defaultValue: otherent, filters: filters)
        let combinedExclent = CombineFilterParameters.combineOtherent(defaultValue: exclent, filters: filters)
        
        var videoURL = URLComponents(string: listingURL)
        if let queryItems = videoURL?.queryItems {
            for index in queryItems.indices {
                let key = videoURL?.queryItems?[index].name ?? .blank
                let filterParam = FilterParameters(rawValue: key)
                switch filterParam {
                case .entities:
                    videoURL?.queryItems?[index].value = combinedEntities
                case .otherent:
                    videoURL?.queryItems?[index].value = combinedOtherent
                case .exclent:
                    videoURL?.queryItems?[index].value = combinedExclent
                default:
                    break
                }
            }
        }
        return videoURL?.string
    }
    
    static func setFilterListingDefaultParameters(listingURL: String, entities: inout String?, otherent: inout String?, exclent: inout String?) {
        let videoURL = URLComponents(string: listingURL)
        videoURL?.queryItems?.forEach({ element in
            let setDefaults = FilterParameters(rawValue: element.name)
            switch setDefaults {
            case .entities:
                entities = element.value
            case .otherent:
                otherent = element.value
            case .exclent:
                exclent = element.value
            default:
                break
            }
        })
    }
}
