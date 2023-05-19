package com.alainmk.translator_kmm.di

import com.alainmk.translator_kmm.database.TranslateDatabase
import com.alainmk.translator_kmm.translate.data.history.SqlDelightHistoryDataSource
import com.alainmk.translator_kmm.translate.data.local.DatabaseDriverFactory
import com.alainmk.translator_kmm.translate.data.remote.HttpClientFactory
import com.alainmk.translator_kmm.translate.data.translate.KtorTranslateClient
import com.alainmk.translator_kmm.translate.domain.history.HistoryDataSource
import com.alainmk.translator_kmm.translate.domain.translate.Translate
import com.alainmk.translator_kmm.translate.domain.translate.TranslateClient

class AppModule {
    val historyDataSource: HistoryDataSource by lazy {
        SqlDelightHistoryDataSource(
            TranslateDatabase(
                DatabaseDriverFactory().create()
            )
        )
    }

    private val translateClient: TranslateClient by lazy {
        KtorTranslateClient(
            HttpClientFactory().create()
        )
    }

    val translateUseCase: Translate by lazy {
        Translate(translateClient, historyDataSource)
    }
}